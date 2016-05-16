<?php

namespace Project29k\BackendBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Templating\EngineInterface;

use Project29k\BackendBundle\Manager\TypeManager;
use Project29k\CoreBundle\DependencyInjection\RenderTrait;
use Project29k\CoreBundle\Entity\Type;

class TypeController
{
    use RenderTrait;

    protected $typeManager;

    public function __construct(
        TypeManager $typeManager
    ) {
        $this->typeManager = $typeManager;
    }

    public function dispatchAction(Request $request, $action, $id)
    {
        /*if (null !== $id) {
            $issue = $this->issueManager->findIssueById($id, $action);
            $parameters->set('issue', $issue);
            $parameters->set('jwtNotes', Notes::getToken($this->getUser()));
        } else {
            $issue = null;
        }*/
        $issue = 8749;

        switch ($action) {
            case 'index':
                return $this->indexAction($request);
            case 'create':
                return $this->createAction($request);
            case 'read':
                return $this->readAction($request, $issue);
            case 'update':
                return $this->updateAction($request, $issue);
            case 'delete':
                return $this->deleteAction($request, $issue);
        }

        throw new NotFoundHttpException();
    }

    public function indexAction(Request $request)
    {
        return $this->renderExtended('BackendBundle:Type:index.html.twig', [
        ]);
    }

    public function createAction(Request $request)
    {
        $type = new Type();
        $type->setIcon('leaf');
        $type->setUnique(true);
        $type->setcategoryId(1);

        $form = $this->formFactory->create('Project29k\BackendBundle\Form\Type\TypeType', $type, ['categories' => $this->typeManager->getCategories(), 'new_option' => 'OO']);
        $form->handleRequest($request);

        if($form->isSubmitted()) {
            if($form->isValid()) {
                $this->typeManager->persist($form->getData());
            }
        }

        $parameters = [];
        $parameters['form'] = $form->createView();

        return $this->renderExtended('BackendBundle:Type:create.html.twig', $parameters);
    }

    public function readAction(Request $request, $issue)
    {
        return $this->renderExtended('BackendBundle:Type:read.html.twig', [
        ]);
    }

    public function updateAction(Request $request, $issue)
    {
        echo $issue;
        return $this->renderExtended('BackendBundle:Type:update.html.twig', [
        ]);
    }

    public function deleteAction(Request $request, $issue)
    {
        return $this->renderExtended('BackendBundle:Type:delete.html.twig', [
        ]);
    }
}
