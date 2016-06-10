<?php
namespace Axipi\CoreBundle\Manager;

use Axipi\CoreBundle\Manager\AbstractManager;
use Axipi\CoreBundle\Entity\Zone;
use Axipi\CoreBundle\Event\ZoneEvent;

class ZoneManager extends AbstractManager
{
    public function getOne($parameters = [])
    {
        return $this->em->getRepository('AxipiCoreBundle:Zone')->getOne($parameters);
    }

    public function getList($parameters = [])
    {
        return $this->em->getRepository('AxipiCoreBundle:Zone')->getList($parameters);
    }

    public function persist($data)
    {
        $this->removeCache($data);

        if($data->getDateCreated() == null) {
            $data->setDateCreated(new \Datetime());
        }
        $data->setDateModified(new \Datetime());

        $this->em->persist($data);
        $this->em->flush();

        $event = new ZoneEvent($data);
        $this->eventDispatcher->dispatch('zone.after_persist', $event);

        return $data->getId();
    }

    public function remove($data)
    {
        $this->removeCache($data);

        $event = new ZoneEvent($data);
        $this->eventDispatcher->dispatch('zone.before_remove', $event);

        $this->em->remove($data);
        $this->em->flush();
    }

    public function removeCache($data)
    {
        $cacheDriver = new \Doctrine\Common\Cache\ApcuCache();

        $cacheId = 'axipi/widgets/'.$data->getCode();
        if($cacheDriver->contains($cacheId)) {
            $cacheDriver->delete($cacheId);
        }
    }
}
