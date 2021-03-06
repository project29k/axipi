<?php
namespace Axipi\CoreBundle\Manager;

use Axipi\CoreBundle\Manager\AbstractManager;
use Axipi\CoreBundle\Entity\Component;
use Axipi\CoreBundle\Event\ComponentEvent;

class ComponentManager extends AbstractManager
{
    public function getOne($paremeters = [])
    {
        return $this->em->getRepository('AxipiCoreBundle:Component')->getOne($paremeters);
    }

    public function getList($parameters = [])
    {
        return $this->em->getRepository('AxipiCoreBundle:Component')->getList($parameters);
    }

    public function persist($data)
    {
        if($data->getDateCreated() == null) {
            $mode = 'insert';
            $data->setDateCreated(new \Datetime());
        } else {
            $mode = 'update';
        }
        $data->setDateModified(new \Datetime());

        $this->em->persist($data);
        $this->em->flush();

        $event = new ComponentEvent($data, $mode);
        $this->eventDispatcher->dispatch('component.after_persist', $event);

        $this->removeCache();

        return $data->getId();
    }

    public function remove($data)
    {
        $event = new ComponentEvent($data, 'delete');
        $this->eventDispatcher->dispatch('component.before_remove', $event);

        $this->em->remove($data);
        $this->em->flush();

        $this->removeCache();
    }
}
