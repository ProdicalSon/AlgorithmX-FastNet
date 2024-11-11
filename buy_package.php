<?php
include 'db_connection.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $packageId = $_POST['package_id'];
    $userPhone = $_POST['user_phone'];

    $command = escapeshellcmd("python3 validate_payment.py $userPhone $packageId");
    $output = shell_exec($command);

    if (trim($output) === "Success") {
        
        $stmt = $pdo->prepare("INSERT INTO transactions (user_id, package_id, status) VALUES (?, ?, ?)");
        $stmt->execute([$userPhone, $packageId, 'Completed']);
        echo "Payment successful, WiFi access granted.";
    } else {
        echo "Payment failed, please try again.";
    }
}
?>
