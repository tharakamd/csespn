<?php
    require_once './global.inc.php';
    session_start();
    verify_oauth_session_exists();

    if (User::currentUser()->getOrganization()->access_level > 2) {
        $sp_id = $_POST['sp_id'];
        $org_id = $_POST['org_id'];
        $contact_name = $_POST['contact_name'];
        $contact_phone = $_POST['contact_phone'];

        $sponsorshipTools = new SponsorshipTools();
        echo json_encode($sponsorshipTools->takeSponsorship($sp_id, $org_id, $contact_name, $contact_phone));
    }