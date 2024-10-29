# Infraestrutura feita para Atividade da primeira avaliação de Cloud computing ☁️🖥️

Grupo:
- Alessandro de Lucena - 01613750
- Vitor Cavalcante - 01655751
- João Gabriel  - 01616867
- Kayk Dario - 01612869
- Marcello José Menezes de Medeiros Filho - 01345111
- Cláudio Roberto da Silva Filho 01662336

<b>Aviso:<b> <p>O arquivo main.tf contém a região definida como sa-east-1 (São Paulo), modifique de acordo com sua necessidade.</p>

## Para aplicar a infraestrutura presente neste projeto com tflocal, execute:
```
tflocal apply infra.tfplan
```
<br>

## Para testar a infraestrutura criada, execute:
```
aws s3 cp <ARQUIVO-PARA-UPLOAD> s3://bronze-bucket/
aws sqs list-queues
aws sns list-topics
aws sqs get-queue-attributes --queue-url <URL_DA_SQS> --attribute-names ApproximateNumberOfMessages
aws sqs receive-message --queue-url <URL_DA_SQS>
```

<p>Para os comandos funcionarem devidamente, você deve substituir os placeholders pelas informações que correspondam à sua realidade.</p>
<p> < ARQUIVO-PARA-UPLOAD > Se trata de um arquivo local em sua máquina que será enviado ao bucket, fazendo o tópico sns perceber o recebimento e enviar uma mensagem à fila. </p>
<p> < URL_DA_SQS > Se trata da URL da fila que foi criada pela infraestrutura testada. </p>