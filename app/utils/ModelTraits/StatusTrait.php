<?php


namespace App\Utils\ModelTraits;


trait StatusTrait
{
    private $status;

    public function isStatus(int $statusCode): bool
    {
        return ($this->status & $statusCode) == $statusCode;
    }

    public function enableStatus(int $statusCode){
        if (!$this->isStatus($statusCode))
            $this->status ^= $statusCode;
    }

    public function disableStatus(int $statusCode){
        if ($this->isStatus($statusCode))
            $this->status ^= $statusCode;
    }
}