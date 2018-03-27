<?php

class Member {

  const DB_TABLE = 'members'; // database table name
  // database fields for this table
  public $member_id = 0;
  public $firstname = '';
  public $lastname = '';
  public $birthdate = null;
  public $deathdate = null;
  public $image = null;
  public $father_firstname = null;
  public $father_lastname = null;
  public $mother_firstname = null;
  public $mother_lastname = null;

  //Deletes a family member by member_id
  public static function delete($id) {
        $db = Db::instance(); // create db connection
        // build query

        $q = sprintf("DELETE FROM members WHERE `member_id` = %d;",
          $id
          );
        $result = $db->query($q); // execute query
  }

  // return a member object by ID
  public static function loadById($member_id) {
      $db = Db::instance(); // create db connection
      // build query
      $q = sprintf("SELECT * FROM `%s` WHERE `member_id` = %d;",
        self::DB_TABLE,
        $member_id
        );
      $result = $db->query($q); // execute query
      if($result->num_rows == 0) {
        return null;
      } else {
        $row = $result->fetch_assoc(); // get results as associative array

        $member = new Member(); // instantiate
        // store db results in local object
        $member->member_id    = $row['member_id'];
        $member->firstname    = $row['firstname'];
        $member->lastname     = $row['lastname'];
        $member->birthdate    = $row['birthdate'];
        $member->deathdate    = $row['deathdate'];
        $member->image        = $row['image'];
        $member->father_firstname    = $row['father_firstname'];
        $member->father_lastname     = $row['father_lastname'];
        $member->mother_firstname    = $row['mother_firstname'];
        $member->mother_lastname     = $row['mother_lastname'];

        return $member; // return the member
      }
  }

  //Gets the member by first and last name
  public static function getMemberByName($firstname, $lastname) {
      $db = Db::instance(); // create db connection
      // build query
      $q = sprintf("SELECT * FROM `%s` WHERE `firstname` = $firstname AND `lastname` = $lastname;",
        self::DB_TABLE
        );
      $result = $db->query($q); // execute query
      // make sure we found something
      if($result->num_rows == 0) {
        return null;
      } else {
        $row = $result->fetch_assoc(); // get results as associative array

        $member = new Member(); // instantiate new member object

        // store db results in local object
        $member->member_id    = $row['member_id'];
        $member->firstname    = $row['firstname'];
        $member->lastname     = $row['lastname'];
        $member->birthdate    = $row['birthdate'];
        $member->deathdate    = $row['deathdate'];
        $member->image        = $row['image'];
        $member->father_firstname    = $row['father_firstname'];
        $member->father_lastname     = $row['father_lastname'];
        $member->mother_firstname    = $row['mother_firstname'];
        $member->mother_lastname     = $row['mother_lastname'];

        return $member; // return the member
      }
  }

  // return all Family Members in an array
  public static function getMembers() {
    $db = Db::instance();
    $q = "SELECT member_id FROM `".self::DB_TABLE."` ORDER BY lastname ASC;";
    $result = $db->query($q);

    $members = array();
    if($result->num_rows != 0) {
      while($row = $result->fetch_assoc()) {
        $members[] = self::loadById($row['member_id']);
      }
    }
    return $members;
  }

  //Saves the new family member and adds them to the database
  public function save(){

    if($this->member_id == 0) {
      return $this->insert();
    } else {
      return $this->update();
    }
  }

  //Inserts the family member into the database
  public function insert() {
    if($this->member_id != 0)
      return null;

    $db = Db::instance(); // connect to db
    // build query
    // format dates for insertion
    if($this->birthdate != '')
      $this->birthdate = $db->formatDate($this->birthdate);
    if($this->deathdate != '')
      $this->deathdate = $db->formatDate($this->deathdate);

      //Query to insert
    $q = sprintf("INSERT INTO members (firstname, lastname, birthdate, deathdate, image, father_firstname, father_lastname, mother_firstname, mother_lastname)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s);",
      $db->escape($this->firstname),
      $db->escape($this->lastname),
      $db->escape($this->birthdate),
      $db->escape($this->deathdate),
      $db->escape($this->image),
      $db->escape($this->father_firstname),
      $db->escape($this->father_lastname),
      $db->escape($this->mother_firstname),
      $db->escape($this->mother_lastname)
      );
    $db->query($q); // execute query
    return $db->getInsertID();
  }

  //Updates specified data in the database
  public function update() {
    if($this->member_id == 0)
      return null; // can't update something without an ID

    $db = Db::instance(); // connect to db

    // format dates for update
    if($this->birthdate != '')
      $this->birthdate = $db->formatDate($this->birthdate);
    if($this->deathdate != '')
      $this->deathdate = $db->formatDate($this->deathdate);;

    // build query

    $q = sprintf("UPDATE `members` SET
    `firstname` =   $db->escape($this->firstname),
    `lastname`  =   $db->escape($this->lastname),
    `birthdate` =   $db->escape($this->birthdate),
    `deathdate` =   $db->escape($this->deathdate),
    `image`     =   $db->escape($this->image),
    `father_firstname`    = $db->escape($this->father_firstname),
    `father_lastname`     = $db->escape($this->father_lastname),
    `mother_firstname`    = $db->escape($this->mother_firstname),
    `mother_lastname`     = $db->escape($this->mother_lastname)
    WHERE `member_id`     = $db->escape($this->member_id);");


    
    $db->query($q); // execute query
    return $db->member_id; // return this object's ID
  }

}
