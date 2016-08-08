<?php
namespace Axipi\CoreBundle\Manager;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\EventDispatcher\EventDispatcherInterface;

abstract class AbstractManager
{
    protected $em;

    protected $eventDispatcher;

    public function setEntityManager(EntityManagerInterface $em)
    {
        $this->em = $em;
    }

    public function setEventDispatcher(EventDispatcherInterface $eventDispatcher)
    {
        $this->eventDispatcher = $eventDispatcher;
    }
}
