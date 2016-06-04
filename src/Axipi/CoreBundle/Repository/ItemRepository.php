<?php
namespace Axipi\CoreBundle\Repository;

use Doctrine\ORM\EntityRepository;
use Axipi\CoreBundle\Entity\Item;

class ItemRepository extends EntityRepository
{
    public function getOne($parameters = []) {
        $cacheDriver = new \Doctrine\Common\Cache\ApcCache();

        $cache_id = false;
        /*if(isset($parameters['slug']) == 1 && isset($parameters['language_code']) == 1) {
            $cache_id = 'axipi/'.$parameters['language_code'].'/'.$parameters['slug'];
        }

        if($cache_id && $cacheDriver->contains($cache_id)) {
            return $cacheDriver->fetch($cache_id);
        }*/

        $em = $this->getEntityManager();

        $query = $em->createQueryBuilder();
        $query->addSelect('pge', 'cmp', 'lng');
        $query->from('AxipiCoreBundle:Item', 'pge');
        $query->leftJoin('pge.component', 'cmp');
        $query->leftJoin('pge.language', 'lng');

        if(isset($parameters['id']) == 1) {
            $query->andWhere('pge.id = :id');
            $query->setParameter(':id', $parameters['id']);
        }

        if(isset($parameters['slug']) == 1) {
            if($parameters['slug'] == '') {
                $query->andWhere('pge.slug IS NULL');
            } else {
                $query->andWhere('pge.slug = :slug');
                $query->setParameter(':slug', $parameters['slug']);
            }

            $query->andWhere('cmp.category = :category');
            $query->setParameter(':category', 'page');
        }

        if(isset($parameters['language_code']) == 1) {
            $query->andWhere('lng.code = :language');
            $query->setParameter(':language', $parameters['language_code']);
        }

        if(isset($parameters['component_service']) == 1) {
            $query->andWhere('cmp.service = :component_service');
            $query->setParameter(':component_service', $parameters['component_service']);
        }

        if(isset($parameters['active']) == 1 && $parameters['active'] == true) {
            $query->andWhere('pge.isActive = :active');
            $query->setParameter(':active', 1);
        }

        $result = $query->getQuery()->setMaxResults(1)->getOneOrNullResult();
        if($cache_id) {
            $cacheDriver->save($cache_id, $result);
        }
        return $result;
    }

    public function getList($parameters = []) {
        $em = $this->getEntityManager();

        $query = $em->createQueryBuilder();
        $query->addSelect('pge', 'cmp', 'lng');
        $query->from('AxipiCoreBundle:Item', 'pge');
        $query->leftJoin('pge.component', 'cmp');
        $query->leftJoin('pge.language', 'lng');
        $query->leftJoin('pge.zone', 'zon');

        if(isset($parameters['ids']) == 1) {
            $query->where('pge.id IN ('.implode(',', $parameters['ids']).')');
        }

        if(isset($parameters['exclude_search']) == 1 && $parameters['exclude_search'] == true) {
            $query->andWhere('pge.excludeSearch = :exclude_search');
            $query->andWhere('cmp.excludeSearch = :exclude_search');
            $query->setParameter(':exclude_search', false);
        }

        if(isset($parameters['exclude_sitemap']) == 1 && $parameters['exclude_sitemap'] == true) {
            $query->andWhere('pge.excludeSitemap = :exclude_sitemap');
            $query->andWhere('cmp.excludeSitemap = :exclude_sitemap');
            $query->setParameter(':exclude_sitemap', false);
        }

        if(isset($parameters['category']) == 1) {
            $query->andWhere('cmp.category = :category');
            $query->setParameter(':category', $parameters['category']);
        }

        if(isset($parameters['language_code']) == 1) {
            $query->andWhere('lng.code = :language');
            $query->setParameter(':language', $parameters['language_code']);
        }

        if(isset($parameters['zone']) == 1) {
            $query->andWhere('zon.code = :zone');
            $query->setParameter(':zone', $parameters['zone']);
        }

        if(isset($parameters['parent']) == 1) {
            $query->andWhere('pge.parent = :parent');
            $query->setParameter(':parent', $parameters['parent']);
        }

        if(isset($parameters['parent_null']) == 1 && $parameters['parent_null'] == true) {
            $query->andWhere('pge.parent IS NULL');
        }

        if(isset($parameters['active']) == 1 && $parameters['active'] == true) {
            $query->andWhere('pge.isActive = :active');
            $query->setParameter(':active', 1);
        }

        if(isset($parameters['component_parent']) == 1) {
            if($parameters['component_parent']->getComponent()->getParent()) {
                $query->andWhere('pge.component = :component_parent');
                $query->setParameter(':component_parent', $parameters['component_parent']->getComponent()->getParent());
            }
        }

        if(isset($parameters['category']) == 1) {
            if($parameters['category'] == 'page') {
                $query->orderBy('pge.slug');
            }
            if($parameters['category'] == 'widget') {
                $query->orderBy('pge.ordering');
            }
        }

        return $query->getQuery()->getResult();
    }

    public function testSlug($data) {
        $em = $this->getEntityManager();

        $query = $em->createQueryBuilder();
        $query->addSelect('pge', 'cmp');
        $query->from('AxipiCoreBundle:Item', 'pge');
        $query->leftJoin('pge.component', 'cmp');

        $query->andWhere('pge.slug = :slug');
        $query->setParameter(':slug', $data->getSlug());

        $query->andWhere('pge.language = :language');
        $query->setParameter(':language', $data->getLanguage());

        if($data->getId()) {
            $query->andWhere('pge.id != :id');
            $query->setParameter(':id', $data->getId());
        }

        return $query->getQuery()->setMaxResults(1)->getOneOrNullResult();
    }

    public function testCode($data) {
        $em = $this->getEntityManager();

        $query = $em->createQueryBuilder();
        $query->addSelect('pge', 'cmp');
        $query->from('AxipiCoreBundle:Item', 'pge');
        $query->leftJoin('pge.component', 'cmp');

        $query->andWhere('pge.code = :code');
        $query->setParameter(':code', $data->getCode());

        $query->andWhere('pge.language = :language');
        $query->setParameter(':language', $data->getLanguage());

        if($data->getId()) {
            $query->andWhere('pge.id != :id');
            $query->setParameter(':id', $data->getId());
        }

        return $query->getQuery()->setMaxResults(1)->getOneOrNullResult();
    }
}
