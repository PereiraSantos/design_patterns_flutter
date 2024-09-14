class Graph {
  final Map<int, Set<int>> adjacenyList = {};

  void addEdge(int source, int target) =>
      adjacenyList.containsKey(source) ? adjacenyList[source]!.add(target) : adjacenyList[source] = {target};
}
