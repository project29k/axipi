<?php
namespace Axipi\CoreBundle\Repository;

use Doctrine\ORM\EntityRepository;

class WidgetPageRepository extends EntityRepository {
    public function getById($id) {
        $em = $this->getEntityManager();

        $query = $em->createQueryBuilder();
        $query->addSelect('wdg_pge', 'wdg', 'pge');
        $query->from('AxipiCoreBundle:WidgetPage', 'wdg_pge');
        $query->leftJoin('wdg_pge.widget', 'wdg');
        $query->leftJoin('wdg_pge.page', 'pge');
        $query->where('wdg_pge.id = :id');

        $query->setParameter(':id', $id);

        return $query->getQuery()->getOneOrNullResult();
    }

    public function getPages() {
        $em = $this->getEntityManager();

        $query = $em->createQueryBuilder();
        $query->addSelect('pge', 'cmp');
        $query->from('AxipiCoreBundle:Page', 'pge');
        $query->leftJoin('pge.component', 'cmp');

        return $query->getQuery()->getResult();
    }
}