<?php

class Event {

  const DB_TABLE = 'events'; // database table name
  // database fields for this table

  public $event_id = 0;
  public $title = '';
  public $year = null;
  public $description = null;
  public $member_id = 0;

  //Deletes an event from the database
  public static function delete($id) {
        $db = Db::instance(); // create db connection
        // build query
        $q = sprintf("DELETE FROM events WHERE `member_id` = %d;", $id);
        $result = $db->query($q); // execute query
  }

  //loads an event by member_id from the database
  public static function loadById($event_id) {
      $db = Db::instance(); // create db connection
      // build query
      $q = sprintf("SELECT * FROM `%s` WHERE `event_id` = %d;",
        self::DB_TABLE,
        $event_id
        );
      $result = $db->query($q); // execute query
      // make sure we found something
      if($result->num_rows == 0) {
        return null;
      }
      else {
        $row = $result->fetch_assoc(); // get results as associative array

        $event = new Event();
        // store db results in local object
        $event->member_id    = $row['member_id'];
        $event->year         = $row['year'];
        $event->description  = $row['description'];
        $event->title        = $row['title'];

        return $event; // return the event
      }
  }

  // return all events by member_id in an array
  public static function getEventsByMember($member_id) {
    $db = Db::instance();
    $q = "SELECT * FROM `events` WHERE `member_id` = $member_id;";
    $result = $db->query($q);
    $events = array();
    if($result->num_rows != 0) {
      while($row = $result->fetch_assoc()) {
        $events[] = self::loadById($row['event_id']);
      }
    }
    return $events;
  }

  //Saves the event
  public function save(){
    if($this->event_id == 0) {
      return $this->insert();
    }
  }

  //Inserts the new event into the databse
  public function insert() {
    if($this->event_id != 0)
      return null;

    $db = Db::instance(); // connect to db
    // build query

    $q = sprintf("INSERT INTO events (title, year, description, member_id)
      VALUES (%s, %d, %s, %s);",
      $db->escape($this->title),
      $this->year,
      $db->escape($this->description),
      $db->escape($this->member_id)
    );
    $db->query($q); // execute query
    return $db->getInsertID();
  }

  //Deletes events by member_id
  public function deleteByMember($member_id) {
    $db = Db::instance(); // create db connection
    // build query
    $q = sprintf("DELETE FROM events WHERE `member_id` = %d;",
      $member_id
      );
    $result = $db->query($q); // execute query
  }

  //Deletes events by event_id
  public function deleteByEvent($event_id) {
    $db = Db::instance(); // create db connection
    // build query
    $q = sprintf("DELETE FROM events WHERE `event_id` = %d;",
      $event_id
      );
    $result = $db->query($q); // execute query
  }

}
