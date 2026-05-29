
main() {
  final listaConvertida = dadosTarefas.map((e) => Tarefa.fromMap(e)).toList();

  listaConvertida.forEach((element) => print(
      'ID: ${element.id}\n'
      'Título: ${element.titulo}\n' 
      'Responsável: ${element.responsavel}\n'
      'Status: ${element.status}\n'
      'Prioridade: ${element.prioridade}\n'
      'Valor: R\$${element.valor?.toStringAsFixed(2).replaceAll('.', ',')}\n'
      'Horas: ${element.horas}\n'
    ),
   );  

  final tarefasConcluidas = listaConvertida.where((tarefa) => tarefa.status == 'concluida',).toList();
  final tarefasPendentes = listaConvertida.where((tarefa) => tarefa.status == 'pendente',).toList();
  final tarefasEmAndamento = listaConvertida.where((tarefa) => tarefa.status == 'em andamento',).toList();
  final tarefasCancelada = listaConvertida.where((tarefa) => tarefa.status == 'cancelada',).toList();
    
    print('\nTarefas concluídas:');
  tarefasConcluidas.forEach((element) {print('- ${element.titulo}');});

    print('\nTarefas pendentes:');
  tarefasPendentes.forEach((element) {print('- ${element.titulo}');});

    print('\nTarefas em andamento:');
  tarefasEmAndamento.forEach((element) {print('- ${element.titulo}');});

    print('\nTarefas canceladas:');
  tarefasCancelada.forEach((element) {print('- ${element.titulo}');});

  double totalTarefasConcluidas = 0;
  tarefasConcluidas.forEach((element) {totalTarefasConcluidas += element.valor ?? 0;});
  print(
  '\nTotal das tarefas concluídas: '
  'R\$ ${totalTarefasConcluidas.toStringAsFixed(2)}');


  double somaTarefasPendentes = 0;
  tarefasPendentes.forEach((element){somaTarefasPendentes += element.valor ?? 0;});
  int quantidadeTarefasPendentes = tarefasPendentes.length;
  double mediaTarefasPendentes = quantidadeTarefasPendentes > 0 ? somaTarefasPendentes / quantidadeTarefasPendentes : 0;  

  if (quantidadeTarefasPendentes > 0)
    print (
      '\nMédia das tarefas pendentes: '
      'R\$ ${mediaTarefasPendentes.toStringAsFixed(2).replaceAll('.', ',')}');
    else
    print (
      'Não existem tarefas pendentes para calcular média.');


  Map<String, int> horasPorStatus = {};
  listaConvertida.forEach((element) {
  String status = element.status ?? 'Sem status';
  int horas = element.horas ?? 0;

  horasPorStatus[status] = (horasPorStatus[status] ?? 0) + horas;});
  print('\nHoras por status:');
  horasPorStatus.forEach((status, horas) {print('$status: $horas horas');});
  }


  



final List<Map<String, dynamic>> dadosTarefas = [
  {
    'id': 1,
    'titulo': ' Corrigir bug login ',
    'responsavel': 'Ana',
    'status': 'concluida',
    'prioridade': 'alta',
    'valor': 'R\$ 120,00',
    'horas': '2',
  },
  {
    'id': 2,
    'titulo': 'Criar tela de perfi l',
    'responsavel': ' Bruno ',
    'status': 'em andamento',
    'prioridade': 'media',
    'valor': 'R\$ 250,50',
    'horas': '5',
  },
  {
    'id': 3,
    'titulo': null,
    'responsavel': 'Carla',
    'status': 'pendente',
    'prioridade': 'baixa',
    'valor': 'R\$ 80,00',
    'horas': null,
  },
  {
    'id': 4,
    'titulo': ' Ajustar navegação ',
    'responsavel': null,
    'status': 'concluida',
    'prioridade': 'alta',
    'valor': 'R\$ 150,75',
    'horas': '3',
  },
  {
    'id': 5,
    'titulo': 'Revisar regras de negócio',
    'responsavel': 'Daniel',
    'status': 'cancelada',
    'prioridade': 'media',
    'valor': 'R\$ 0,00',
    'horas': '0',
  },
  {
    'id': 6,
    'titulo': 'Implementar validação de dados',
    'responsavel': 'Eduarda',
    'status': 'concluida',
    'prioridade': 'alta',
    'valor': 'R\$ 200,00',
    'horas': '4',
  },
  {
    'id': 7,
    'titulo': 'Organizar documentação',
    'responsavel': 'Felipe',
    'status': 'pendente',
    'prioridade': 'baixa',
    'valor': 'R\$ 90,00',
    'horas': '2',
  },
];

class Tarefa {
  final int id;
  final String? titulo;
  final String? responsavel;
  final String? status;
  final String? prioridade;
  final double? valor;
  final int? horas;

  Tarefa({
    required this.id,
    required this.titulo,
    required this.responsavel,
    required this.status,
    required this.prioridade,
    required this.valor,
    required this.horas,
  });

  factory Tarefa.fromMap(Map map){
    final valorSemRCifrao = map['valor'].toString().replaceAll('R\$', '');
    final valorSemEspacos = valorSemRCifrao.trim();
    final valorFormatado = valorSemEspacos.replaceAll(',','.');
    final valorConvertido = double.tryParse(valorFormatado) ?? 0.0;
    final horasConvertidas = int.tryParse(map['horas']?.toString() ?? '') ?? 0;

    return Tarefa(
      id: map['id'] ?? 0, 
      titulo: map ['titulo']?.trim() ?? 'Sem título',
      responsavel: map ['responsavel']?.trim() ?? 'Não informado', 
      status: map ['status']?.trim() ?? 'Sem status',
      prioridade: map ['prioridade']?.trim() ?? 'Sem prioridade',
      valor: valorConvertido, 
      horas: horasConvertidas,
    );
  }
}

  
