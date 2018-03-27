<?php

include_once '../global.php';

// get the identifier for the page we want to load
$action = $_GET['action'];

// instantiate a SiteController and route it
$sc = new SiteController();
$sc->route($action);

class SiteController {

	// route us to the appropriate class method for this action
	public function route($action) {
		switch($action) {
			case 'home':
				$this->home();
				break;
			case 'home_unreg':
				$this->home_unreg();
				break;
			case 'myfamily':
				$this->myfamily();
				break;
			case 'login':
				$this->login();
				break;
			case 'loginProcess':
				$user = $_POST['user'];
				$pass = $_POST['pass'];
				$this->loginProcess($user, $pass);
				break;
			case 'logout':
				$this->logout();
				break;
		}

	}

//Runs the login process to gain access to the website
	public function loginProcess($un, $pw) {
		$correctUser = 'tony';
		$correctPass = 'gui';

		if($un != $correctUser)
			header('Location: '.BASE_URL);
		elseif($pw != $correctPass)
			header('Location: '.BASE_URL);
		else {
			$_SESSION['username'] = $un;
			header('Location: '.BASE_URL.'/loggedin'); exit();
		}
	}

	//Brings the user to the home page
  public function home() {
		$pageTitle = 'Home';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/home.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	//Brings the user to the not logeed in home page
	public function home_unreg() {
		$pageTitle = 'Home';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/homenotsignedin.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	//Brings the user to the family list page
	public function myfamily() {
		$pageTitle = 'My Family';
		$members= Member::getMembers();
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/myfamily.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
  }

	// Brings the user to the login page
	public function login() {
		$pageTitle = 'Login';
		include_once SYSTEM_PATH.'/view/header.tpl';
		include_once SYSTEM_PATH.'/view/login.tpl';
		include_once SYSTEM_PATH.'/view/footer.tpl';
	}

	//Logs the user out and sends them to hte unregistered home page
	public function logout() {
		unset($_SESSION['username']);
		session_destroy();
		header('Location: '.BASE_URL); exit(); // sends to home page
	}


}
