# googlecloud_terraform_desafiofinal

## Como automatizar infraestruturas no Google Cloud com o Terraform: laboratório com desafio

# Cenário do desafio

Você é um estagiário de engenharia de nuvem para uma nova startup. Para seu primeiro projeto, seu novo chefe o encarregou de criar uma infraestrutura de maneira rápida e eficiente e gerar um mecanismo para acompanhá-la para futuras referências e alterações. Você foi instruído a usar o Terraform para concluir o projeto.

Para este projeto, você usará o Terraform para criar, implantar e acompanhar a infraestrutura no provedor preferencial da startup, o Google Cloud. Você também precisará importar algumas instâncias mal gerenciadas para sua configuração e corrigi-las.

Neste laboratório, você usará o Terraform para importar e criar várias instâncias de VM, uma rede VPC com duas sub-redes e uma regra de firewall para que a VPC permita conexões entre as duas instâncias. Você também criará um bucket do Cloud Storage para hospedar seu back-end remoto.

# Tarefa 1. Crie os arquivos de configuração
No Cloud Shell, crie seus arquivos de configuração do Terraform e uma estrutura de diretório semelhante a esta:

main.tf
variáveis.tf
módulos/
└── instâncias
    ├── instâncias.tf
    ├── saídas.tf
    └── variáveis.tf
└── armazenamento
    ├── storage.tf
    ├── saídas.tf
    └── variáveis.tf
Copiado!
Preencha os variables.tfarquivos no diretório raiz e dentro dos módulos. Adicione três variáveis ​​a cada arquivo: region, zonee project_id. Para seus valores padrão, use us-east1, <preenchido no início do laboratório> e seu ID do projeto do Google Cloud.
Observação: você deve usar essas variáveis ​​em qualquer lugar aplicável em suas configurações de recursos.
Adicione o bloco Terraform e o Google Provider ao main.tfarquivo. Verifique se o argumento de zona foi adicionado junto com os argumentos de projeto e região no bloco Google Provider.

Inicialize o Terraform.

# Tarefa 2. Infraestrutura de importação
No Console do Google Cloud, no menu de navegação , clique em Compute Engine > VM Instances . Duas instâncias nomeadas tf-instance-1e tf-instance-2já foram criadas para você.
Nota: clicando em uma das instâncias, você pode encontrar seu Instance ID , imagem do disco de inicialização e tipo de máquina . Tudo isso é necessário para escrever as configurações corretamente e importá-las para o Terraform.
Importe as instâncias existentes para o instancesmódulo. Para fazer isso, você precisará seguir estas etapas:
Primeiro, adicione a referência do módulo ao main.tfarquivo e reinicie o Terraform.

Em seguida, grave as configurações de recursos no instances.tfarquivo para corresponder às instâncias pré-existentes.

Nomeie suas instâncias tf-instance-1e tf-instance-2.
Para os propósitos deste laboratório, a configuração do recurso deve ser a mínima possível. Para fazer isso, você só precisará incluir os seguintes argumentos adicionais em sua configuração: machine_type, boot_disk, network_interface, metadata_startup_scripte allow_stopping_for_update. Para os dois últimos argumentos, use a seguinte configuração, pois isso garantirá que você não precise recriá-lo:
metadata_startup_script = <<-EOT
        #!/bin/bash
    EOT
allow_stopping_for_update = verdadeiro
Copiado!
Depois de escrever as configurações de recursos no módulo, use o terraform importcomando para importá-las para o instancesmódulo.

Aplique suas alterações. Observe que, como você não preencheu todos os argumentos em toda a configuração, o applyatualizará as instâncias no local . Isso é bom para fins de laboratório, mas em um ambiente de produção, você deve preencher todos os argumentos corretamente antes de importar.
Clique em Verificar meu progresso para verificar o objetivo.
Infraestrutura de importação.


# Tarefa 3. Configurar um back-end remoto
Crie um recurso de bucket do Cloud Storage dentro do storagemódulo. Para o nome do intervalo , use Nome do intervalo . Para o resto dos argumentos, você pode simplesmente usar:
location = "US"
force_destroy = true
uniform_bucket_level_access = true
Observação: opcionalmente, você pode adicionar valores de saída dentro do outputs.tfarquivo.
Adicione a referência do módulo ao main.tfarquivo. Inicialize o módulo e applyas alterações para criar o bucket usando o Terraform.

Configure este depósito de armazenamento como o back-end remoto dentro do main.tfarquivo. Certifique-se de usar o prefixo terraform/state para que possa ser avaliado com sucesso.

Se você escreveu a configuração corretamente, no init, o Terraform perguntará se você deseja copiar os dados de estado existentes para o novo back-end. Digite yesno prompt.

Clique em Verificar meu progresso para verificar o objetivo.
Configure um back-end remoto.


# Tarefa 4. Modificar e atualizar a infraestrutura
Navegue até o instancesmódulo e modifique o recurso tf-instance-1 para usar um n1-standard-2tipo de máquina.

Modifique o recurso tf-instance-2 para usar um n1-standard-2tipo de máquina.

Adicionar um recurso de terceira instância e nomeá-lo Nome da instância . Para este terceiro recurso, use um n1-standard-2tipo de máquina.

Inicialize o Terraform e applysuas alterações.

Nota: Opcionalmente, você pode adicionar valores de saída desses recursos no outputs.tfarquivo dentro do módulo.
Clique em Verificar meu progresso para verificar o objetivo.
Modificar e atualizar a infraestrutura.


# Tarefa 5. Destruir recursos
Destrua a terceira instância Nome da instância removendo o recurso do arquivo de configuração. Depois de removê-lo, inicialize o terraform e applyas alterações.
Clique em Verificar meu progresso para verificar o objetivo.
Destruir recursos.


# Tarefa 6. Use um módulo do Registro
No Terraform Registry, navegue até o Network Module .

Adicione este módulo ao seu main.tfarquivo. Use as seguintes configurações:

Use a versão 6.0.0(versões diferentes podem causar erros de compatibilidade).

Nomeie a VPC Nome da VPC , e use um modo de roteamento global .

Especifique 2 sub-redes na us-east1região e nomeie- subnet-01as como subnet-02. Para os argumentos subnets, você só precisa de Name , IP e Region .

Use o IP 10.10.10.0/24para subnet-01e 10.10.20.0/24para subnet-02.

Você não precisa de nenhum intervalo ou rota secundário associado a esta VPC, portanto, pode omiti-los da configuração.

Depois de escrever a configuração do módulo, inicialize o Terraform e execute um applypara criar as redes.

Em seguida, navegue até o instances.tfarquivo e atualize os recursos de configuração para conectar tf-instance-1 a subnet-01e tf-instance-2 a subnet-02.

Nota: Dentro da configuração da instância, você precisará atualizar o argumento de rede para VPC Name e, em seguida, adicionar o argumento de sub-rede com a sub-rede correta para cada instância.
Clique em Verificar meu progresso para verificar o objetivo.
Use um módulo do Registro.


# Tarefa 7. Configurar um firewall
Crie um recurso de regra de firewall no main.tfarquivo e nomeie-o como tf-firewall .
Esta regra de firewall deve permitir que o Nome da VPC rede para permitir conexões de entrada em todos os intervalos de IP ( 0.0.0.0/0) na porta TCP 80 .
Certifique-se de adicionar o source_rangesargumento com o intervalo de IP correto ( 0.0.0.0/0).
Inicialize o Terraform e applysuas alterações.
Nota: Para recuperar o networkargumento necessário, você pode inspecionar o estado e localizar o ID ou self_link do google_compute_networkrecurso que você criou. Será no formato . projects/PROJECT_ID/global/networks/ VPC Name
Clique em Verificar meu progresso para verificar o objetivo.
Configure um firewall.


# Teste de conectividade (opcional)
Depois de criar uma regra de firewall para permitir conexões internas na VPC, você pode, opcionalmente, executar um teste de conectividade de rede.

Verifique se ambas as VMs estão em execução.

Navegue até Inteligência de rede > Testes de conectividade . Execute um teste de conectividade nas duas VMs para verificar se elas podem ser acessadas. Agora você validou a conectividade entre as instâncias!

Observação: certifique-se de que a API de gerenciamento de rede esteja ativada com sucesso; se não estiver, clique em Ativar .
Suas definições de configuração devem se parecer com o seguinte:

Página de definições de configuração

# Parabéns!
Se você conseguiu importar, criar, modificar e configurar a arquitetura dentro do tempo estipulado, demonstrou grande competência em suas habilidades no Terraform! Neste laboratório, você começou importando duas VMs pré-configuradas para o Terraform e criando um bucket do Cloud Storage para configurar seu back-end. Em seguida, você adicionou outra instância e praticou a modificação e atualização das configurações de recursos em seus módulos. Por fim, você usou um módulo do Terraform Registry para criar uma VPC com duas sub-redes, conectou as instâncias a ela e criou uma regra de firewall para permitir conexões entre elas.
