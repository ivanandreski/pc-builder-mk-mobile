class RemotePcBuildService {
  static final RemotePcBuildService _instance =
  RemotePcBuildService._privateConstructor();

  RemotePcBuildService._privateConstructor();

  static RemotePcBuildService get instance => _instance;

  // Future<PcBuildCompatibility?> checkCompatibility(PcBuild? pcBuild) async {
  //   if (pcBuild == null) return null;
  //   final url = Uri.parse(
  //     // change this to the new url
  //       '${Constants.apiUrl}/product?category=${category}&page=${page}&pageSize=12');
  //   final response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     return PcBuildCompatibility(json.decode(response.body));
  //   }
  //
  //   return null;
  // }
}