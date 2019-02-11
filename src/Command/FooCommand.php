<?php

namespace App\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\DependencyInjection\ContainerInterface;

class FooCommand extends Command
{

    private $container;
    
    public function __construct($name = null, ContainerInterface $container)
    {
        parent::__construct($name);
        $this->container = $container;
    }

    protected function configure()
    {
        $this
            ->setName('foo:bar');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $output->print("Hello Foo");
    }
}