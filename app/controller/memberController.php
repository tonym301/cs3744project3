<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

$sc = new MemberController();
$sc->route($action);

class MemberController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {
			//Cases that can occur throughout the website
			case 'add':
				$this->add();
				break;
      case 'view':
        $member_id = $_GET['member_id'];
  			$this->view($member_id);
  			break;
			case 'addMember':
				$this->addMember();
				break;
			case 'delete':
				$this->delete();
				break;
			case 'confirm':
				$id = $_POST['id'];
				$this->confirm($id);
				break;
			case 'deleted':
				if (isset($_POST['no'])) {
					$this->delete();
				}
				else if (isset($_POST['yes'])) {
					$id = $_POST['member_id'];
					$this->remove($id);
				}
				break;
			case 'edit':
				$this->edit();
				break;
			case 'editMember':
				$member_id = $_GET['member_id'];
				$this->editMember($member_id);
				break;
			case 'search':
				$this->search();
				break;
			case 'searching':
				$firstname = $_GET['firstname'];
				$lastname = $_GET['lastname'];
				$this->searching($firstname, $lastname);
				break;
			case 'personalEdit':
				$this->personalEdit();
				break;
			case 'photoEdit':
				$image = $_POST['image'];
				$member_id = $_POST['member_id'];
				$this->photoEdit($image, $member_id);
				break;
			case 'eventEdit':
				$this->eventEdit();
				break;
		}
	}

	// Goes to the Add member page
  public function add() {
		$pageTitle = 'Add Family Member';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/addmember.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	// Goes to the delete member page
	public function delete() {
		$pageTitle = 'Delete Family Member';
		$members= Member::getMembers();
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/deletemember.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	// Goes to the confirm delete member page where it asks the user to confirm deletion
	public function confirm($id) {
		if( $id == 0) {
			header('Location: '.BASE_URL.'/member/delete/'); exit();
		}
		$pageTitle = 'Confirm Delete';
		$member= Member::loadById($id);
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/confirm.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

  // Removes a family member from the database
	public function remove($id) {
		$pageTitle = 'Delete Family Member';
		Member::delete($id);
		header('Location: '.BASE_URL.'/member/delete/'); exit();
	}

	// Adds the member to the family and database
	public function addMember() {
		// get POST variables
		$firstname 	 = $_POST['firstname']; // required
		$lastname 	 = $_POST['lastname']; // required
		$birthdate   = $_POST['birthdate'];
		$deathdate   = $_POST['deathdate'];
		$image       = $_POST['image'];
		$father_firstname    = $_POST['father_firstname'];
		$father_lastname     = $_POST['father_lastname'];
		$mother_firstname    = $_POST['mother_firstname'];
		$mother_lastname     = $_POST['mother_lastname'];

		if( empty($firstname) || empty($lastname)) {
			header('Location: '.BASE_URL.'/member/add/'); exit();
		}

		$member = new Member();
		$member->firstname    = $firstname;
		$member->lastname     = $lastname;
		$member->birthdate    = $birthdate;
		$member->deathdate    = $deathdate;
		$member->image        = $image;
		$member->father_firstname    = $father_firstname;
		$member->father_lastname     = $father_lastname;
		$member->mother_firstname    = $mother_firstname;
		$member->mother_lastname     = $mother_lastname;

		$member_id = $member->save();

		if (isset($_POST['submit'])) {
    		$nameValues = $_POST['name'];
				$relValues = $_POST['relationship'];
    		$i = 0;

    		while($i < sizeof($nameValues)) {
					$relation = new Relation();
					$relation->member_id = $member_id;
					$relation->name = $nameValues[$i];
					$relation->relation = $relValues[$i];
        	$relation->save();
        	$i++;
    			}
			}
		header('Location: '.BASE_URL.'/member/view/'.$member_id); exit();
	}

	// Views a specified member page
  public function view($member_id) {
		$pageTitle = 'Member';
		include_once SYSTEM_PATH.'/view/header.tpl';
		$relations = Relation::getRelationsByMember($member_id);
		$events = Event::getEventsByMember($member_id);
		$member = Member::loadById($member_id);
		if($member != null) {
			include_once SYSTEM_PATH.'/view/member.tpl';
		}
		else {
			die('Invalid member ID');
		}
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	//Searches for a family member
	public function searching($firstname, $lastname) {
		$pageTitle = 'Searching';
		$member = Member::getMemberByName($firstname, $lastname);
		$id = $member->member_id;
		header('Location: '.BASE_URL.'/member/add/'); exit();
  }

	//Goes to the search page of the website
	public function search() {
		$pageTitle = 'Search';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/search.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	//Goes to the edit page of the website
	public function edit() {
		$pageTitle = 'Edit Member';
		include_once SYSTEM_PATH.'/view/header.tpl';
		$members= Member::getMembers();
		include_once SYSTEM_PATH.'/view/edit.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	// Goes to a specified member to edit
	public function editMember($member_id) {
		$pageTitle = 'Edit Member';
		include_once SYSTEM_PATH.'/view/header.tpl';
		$member = Member::loadById($member_id);
		$relations = Relation::getRelationsByMember($member_id);
		$events = Event::getEventsByMember($member_id);
		include_once SYSTEM_PATH.'/view/editmember.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	//Edits personal inofrormation of a member
	public function personalEdit() {
		$pageTitle = 'Edit Member';
		$firstname 	 = $_POST['firstname']; // required
		$lastname 	 = $_POST['lastname'];
		$birthdate   = $_POST['birthdate'];
		$deathdate   = $_POST['deathdate'];
		$father_firstname    = $_POST['father_firstname'];
		$father_lastname     = $_POST['father_lastname'];
		$mother_firstname    = $_POST['mother_firstname'];
		$mother_lastname     = $_POST['mother_lastname'];
		$member_id 					 = $_POST['member_id'];

		if( empty($firstname)) {
			header('Location: '.BASE_URL.'/member/edit/'); exit();
		}

		$member = Member::loadById($member_id);
		$member->firstname    = $firstname;
		$member->lastname     = $lastname;
		$member->birthdate    = $birthdate;
		$member->deathdate    = $deathdate;
		$member->father_firstname    = $father_firstname;
		$member->father_lastname     = $father_lastname;
		$member->mother_firstname    = $mother_firstname;
		$member->mother_lastname     = $mother_lastname;
		if($member == null)
		{
				header('Location: '.BASE_URL.'/member/add/'); exit();
		}
		$member->save();
		header('Location: '.BASE_URL.'/member/edit/'); exit();
  }

	//Edits a photo of a member
	public function photoEdit($image, $member_id) {
		$pageTitle = 'Edit Member';
		$member = Member::loadById($member_id);
		$member->image = $image;
		$member->update();
		header('Location: '.BASE_URL.'/member/edit/'); exit();
  }

	//Edits life events of a member
	public function eventEdit() {
		$pageTitle = 'Edit Member';
		$title 	 			 = $_POST['title']; // required
		$year 	 			 = $_POST['year']; // required
		$description   = $_POST['description'];
		$member_id   	 = $_POST['member_id'];

		if( empty($title) || empty($year)) {
			header('Location: '.BASE_URL.'/member/edit/'); exit();
		}

		$event = new Event();
		$event->title    = $title;
		$event->year     = $year;
		$event->description    = $description;
		$event->member_id 		 = $member_id;
		$event_id = $event->save();
		header('Location: '.BASE_URL.'/member/edit/'.$member_id); exit();
  }




}
?>
