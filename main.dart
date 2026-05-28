main() {
  final listaConvertida = dadosTarefas.map((e) => Tarefa.fromMap(e);
  {
   return Tarefa(
    id: item['id'],
    titulo: item['titulo'] ?? 'Sem título',
    responsavel: item['responsavel'] ?? 'Não informado',
    status: item['status'] ?? 'sem status',
    prioridade: item['prioridade'] ?? 'sem prioridade',
   
);  

  }).toList();
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

  Tarefa.fromMap(Map map)
    : id = map['id'],
      titulo = map['titulo'] ?? 'Sem título',
      responsavel = map['responavel']?? 'Não informado',
      status = map['status'] ?? 'sem status',
      prioridade = map['prioridade']?? 'sem prioridade',
      valor = map['valor'],
      horas = map['horas'];
}
