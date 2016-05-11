<?php
namespace Acme\OrderEntry;

/**
 * Class Order
 * @package Acme\OrderEntry
 */
class Order
{
    /**
     * @var int
     */
    private $orderId;

    /**
     * @return int
     */
    public function getOrderId()
    {
        return $this->orderId;
    }

    /**
     * @param int $orderId
     */
    public function setOrderId($orderId)
    {
        $this->orderId = $orderId;
    }
}
