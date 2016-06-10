<?php
namespace Axipi\CoreBundle\Manager;

use Axipi\CoreBundle\Manager\AbstractManager;
use Axipi\CoreBundle\Entity\Relation;
use Axipi\CoreBundle\Event\RelationEvent;

class RelationManager extends AbstractManager
{
    public function getOne($parameters = [])
    {
        return $this->em->getRepository('AxipiCoreBundle:Relation')->getOne($parameters);
    }

    public function getList($parameters = [])
    {
        return $this->em->getRepository('AxipiCoreBundle:Relation')->getList($parameters);
    }

    public function persist($data)
    {
        $this->removeCache($data);

        $cacheDriver = new \Doctrine\Common\Cache\ApcuCache();
        $cacheId = 'axipi/relations/'.$data->getWidget()->getId();
        if($cacheDriver->contains($cacheId)) {
            $cacheDriver->delete($cacheId);
        }

        if($data->getDateCreated() == null) {
            $data->setDateCreated(new \Datetime());
        }
        $data->setDateModified(new \Datetime());

        $this->em->persist($data);
        $this->em->flush();

        $event = new RelationEvent($data);
        $this->eventDispatcher->dispatch('relation.after_persist', $event);

        return $data->getId();
    }

    public function remove($data)
    {
        $this->removeCache($data);

        $event = new RelationEvent($data);
        $this->eventDispatcher->dispatch('relation.before_remove', $event);

        $this->em->remove($data);
        $this->em->flush();
    }

    public function removeCache($data)
    {
        $cacheDriver = new \Doctrine\Common\Cache\ApcuCache();

        $cacheId = 'axipi/relations/'.$data->getWidget()->getId();
        if($cacheDriver->contains($cacheId)) {
            $cacheDriver->delete($cacheId);
        }
    }
}
