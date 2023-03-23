
cenário de desafio

Você iniciou uma nova função como Engenheiro de nuvem júnior da Jooli, Inc. 
Espera-se que você ajude a gerenciar a infraestrutura da Jooli. 
Tarefas comuns incluem provisionamento de recursos para projetos.

Espera-se que você tenha as habilidades e conhecimentos para essas tarefas, 
portanto, guias passo a passo não são fornecidos.

Alguns padrões da Jooli, Inc. que você deve seguir:

Crie todos os recursos na região ou zona padrão, a menos que seja instruído de outra forma.

A nomenclatura normalmente usa o formato equipe-recurso ; por exemplo, uma instância pode ser nomeada núcleo-webserver1.


Aloque tamanhos de recursos econômicos. Os projetos são monitorados e o uso excessivo de recursos resultará no encerramento do projeto
que os contém (e possivelmente no seu), portanto, planeje com cuidado. Esta é a orientação que a equipe de monitoramento está disposta
a compartilhar: a menos que seja orientado, use f1-micro para pequenas VMs do Linux e use n1-standard-1 para Windows ou outros aplicativos, como nós do Kubernetes.

Tarefa 1. 
Criar uma instância jumphost do projeto
Você usará esta instância para executar a manutenção do projeto.

Requisitos:

Nomeie a instânciaNome da instância.
Use um tipo de máquina f1-micro .
Use o tipo de imagem padrão (Debian Linux).

Tarefa 2.
Criar um cluster de serviço 

A equipe está construindo um aplicativo que usará um serviço executado no Kubernetes. Você precisa:

Crie um cluster zonal usando<preenchido no início do laboratório>.
Use o hello-app do contêiner do Docker ( gcr.io/google-samples/hello-app:2.0) como um espaço reservado;
a equipe substituirá o contêiner por seu próprio trabalho posteriormente.
Expor o aplicativo na portaNúmero da porta do aplicativo

Tarefa 3. 
Configurar um balanceador de carga HTTP

Você servirá o site por meio de servidores da Web nginx, mas deseja garantir que o ambiente seja tolerante a falhas. 
Crie um balanceador de carga HTTP com um grupo de instâncias gerenciadas de 2 servidores web nginx . 
Use o seguinte código para configurar os servidores web; 
a equipe substituirá isso por sua própria configuração posteriormente.

Você precisa:

Crie um modelo de instância.
Crie um pool de destino.
Crie um grupo de instâncias gerenciadas.
Crie uma regra de firewall chamada comoregra de firewallpara permitir o tráfego (80/tcp).
Crie uma verificação de integridade.
Crie um serviço de back-end e anexe o grupo de instâncias gerenciadas com a porta nomeada (http:80).
Crie um mapa de URL e direcione o proxy HTTP para rotear solicitações para seu mapa de URL.
Crie uma regra de encaminhamento. 
