# Docker Poll Application

## Requirements

The vagrant machine that you created in the DevOps workshop.

## Steps
1. Pull our repo into the root of the spring-petclinic directory
    `git clone https://github.com/SLS-ALL/Poll.git`

2. `sudo -i`
3. `cd /vagrant/Poll`
4. `docker build -t poll .`
5. `docker run -itd -p 9966:80 -e MODULE=poll -v /vagrant/Poll/app/poll:/opt/django/app --name=poll poll`
6. Browse to <http://localhost:9966/polls>
7. Answer the questions.  Sorry, there is not a back button with this demo.
