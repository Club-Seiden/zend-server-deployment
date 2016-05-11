<?php

require __DIR__ . '/../vendor/autoload.php';

$order = new \Acme\OrderEntry\Order();
$order->setOrderId($_GET['orderId']);
echo "Order id is: " . $order->getOrderId();
