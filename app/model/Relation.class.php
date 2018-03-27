<?php


class Relation {

  const DB_TABLE = 'relationships'; // database table name
  // database fields for this table
  public $relation_id = 0;
  public $member_id = 0;
  public $name = '';
  public $relation = '';

  //Loads a relation by member_id
  public static function loadById($relation_id) {
      $db = Db::instance(); // create db connection
      // build query
      $q = sprintf("SELECT * FROM relationships WHERE `relation_id` = %d;",
        $relation_id
        );
      $result = $db->query($q); // execute query
      if($result->num_rows == 0) {
        return null;
      } else {
        $row = $result->fetch_assoc(); // get results as associative array

        $relation = new Relation(); // instantiate
        // store db results in local object
        $relation->member_id    = $row['member_id'];
        $relation->relation     = $row['relation'];
        $relation->name         = $row['name'];
        return $relation; // return the relation
      }
  }

  //Gest the relations by member_id
  public static function getRelationsByMember($member_id) {
    $db = Db::instance();
    $q = "SELECT * FROM relationships WHERE `member_id` = $member_id;";
    $result = $db->query($q);

    $relations = array();
    if($result->num_rows != 0) {
      while($row = $result->fetch_assoc()) {
        $relations[] = self::loadById($row['relation_id']);
      }
    }
    return $relations;
  }

  //Saves the relation into the databse
  public function save(){

    if($this->relation_id == 0) {
      return $this->insert();
    }
  }

  //Sends the data to the database to store
  public function insert() {

    $db = Db::instance(); // connect to db
    $q = sprintf("INSERT INTO relationships (member_id, relation, name)
    VALUES (%s, %s, %s);",
      $db->escape($this->member_id),
      $db->escape($this->relation),
      $db->escape($this->name)
      );
    $db->query($q); // execute query
    return $db->getInsertID();
  }

  //Delete relation by member_id
  public function deleteByMember($member_id) {
    $db = Db::instance(); // create db connection
    // build query
    $q = sprintf("DELETE FROM relationships WHERE `member_id` = %d;",
      $member_id
      );
    $result = $db->query($q); // execute query
  }

  //Delete relation by relation_id
  public function deleteByRelation($relation_id) {
    $db = Db::instance(); // create db connection
    // build query
    $q = sprintf("DELETE FROM relationships WHERE `relation_id` = %d;",
      $relation_id
      );
    $result = $db->query($q); // execute query
  }
}
