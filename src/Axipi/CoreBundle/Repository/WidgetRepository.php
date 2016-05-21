<?php
namespace Axipi\CoreBundle\Repository;

use Doctrine\ORM\EntityRepository;

class WidgetRepository extends EntityRepository {
    public function getById($id) {
        $em = $this->getEntityManager();

        $query = $em->createQueryBuilder();
        $query->addSelect('wdg', 'cmp');
        $query->from('AxipiCoreBundle:Widget', 'wdg');
        $query->leftJoin('wdg.component', 'cmp');
        $query->where('wdg.id = :id');

        $query->setParameter(':id', $id);

        return $query->getQuery()->getOneOrNullResult();
    }

    public function getRows() {
        $em = $this->getEntityManager();

        $query = $em->createQueryBuilder();
        $query->addSelect('wdg', 'cmp');
        $query->from('AxipiCoreBundle:Widget', 'wdg');
        $query->leftJoin('wdg.component', 'cmp');
        $query->where('cmp.category = :category');

        $query->setParameter(':category', 'widget');

        return $query->getQuery();
    }

    public function getPrograms() {
        $em = $this->getEntityManager();

        $query = $em->createQueryBuilder();
        $query->addSelect('prg', 'lng', 'cou');
        $query->from('AxipiCoreBundle:Program', 'prg');
        $query->leftJoin('prg.language', 'lng');
        $query->leftJoin('prg.country', 'cou');

        return $query->getQuery()->getResult();
    }

    public function getComponents() {
        $em = $this->getEntityManager();

        $query = $em->createQueryBuilder();
        $query->addSelect('cmp');
        $query->from('AxipiCoreBundle:Component', 'cmp');
        $query->where('cmp.category = :category');
        $query->andWhere('cmp.isActive = :active');

        $query->setParameter(':category', 'widget');
        $query->setParameter(':active', 1);

        $query->orderBy('cmp.title');

        return $query->getQuery()->getResult();
    }

    public function getZones() {
        $em = $this->getEntityManager();

        $query = $em->createQueryBuilder();
        $query->addSelect('zon');
        $query->from('AxipiCoreBundle:Zone', 'zon');

        return $query->getQuery()->getResult();
    }
}
