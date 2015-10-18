rdb-fullstack
=============

Common code for the Relational Databases and Full Stack Fundamentals courses

## Requirements:
* [Virtual Box](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](https://www.vagrantup.com/downloads.html)
* terminal

## How to Download
    git clone https://github.com/brianhoppus/tournament-planer


## How to Run
* In your terminal, navigate to your cloned folder location
    
        cd ~/Desktop/tournament-planner/vagrant
        
* Startup and login to your vagrant virtual machine
        
        vagrant up
        vagrant ssh

* Inside the VM, navigate to the code directory, and setup the database
       
        cd /vagrant/tournament
        psql
        \i tournament.sql
        \q

* Finally, run the unit tests!
    
        python tournament_test.py
