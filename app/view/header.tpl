<!DOCTYPE html>
<html lang="en">
<head>
  <title><?= $pageTitle ?> | My Family Tree</title>
  <meta charset="utf-8"/>
  <link rel="stylesheet" type="text/css" href="<?= BASE_URL ?>/public/css/style.css"></link>
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/jquery-3.3.1.js"></script>
  <script type="text/javascript" src="<?= BASE_URL ?>/public/js/myjquery.js"></script>
</head>
<body>

<div id="header">
<ul class="nav">
  <!-- Checks if logged in -->
  <?php if(isset($_SESSION['username'])): ?>
    <li><a title="Go Home" href="<?= BASE_URL ?>/loggedin/">Home</a></li>
    <li><a title="My family" href="<?= BASE_URL ?>/myfamily/">My Family</a></li>
    <li><a title="Search for a family member"href="<?= BASE_URL ?>/member/search/">Search Family</a></li>
    <li><a title="Add a family member" href="<?= BASE_URL ?>/member/add/">Add Family Member</a></li>
    <li><a title="Edit a family member" href="<?= BASE_URL ?>/member/edit/">Edit Family Member</a></li>
    <li><a title="Delete a family member" href="<?= BASE_URL ?>/member/delete/">Delete Family Member</a></li>
    <li class="logout"><a href="<?= BASE_URL ?>/logout/">Log out</a></li>
    <li class="logout"><a title="Go to my page" href="<?= BASE_URL ?>/myfamily/">Logged in as <strong><?= $_SESSION['username'] ?></strong></a></li>
  <?php else: ?>
    <li><a href="<?= BASE_URL ?>">Home</a></li>
    <li class="logout"><a href="<?= BASE_URL ?>/login/">Log in</a></li>
  <?php endif; ?>
</ul>
</div><!-- #header -->

<!-- Start of conent in the body -->
<div id="content">
