class CategorySlugs {
  static const String caseSlug = "case";
  static const String gpuSlug = "gpu";
  static const String storageSlug = "storage";
  static const String mbSlug = "mb";
  static const String psuSlug = "psu";
  static const String cpuSlug = "cpu";
  static const String ramSlug = "ram";
}

class CategoryTitles {
  static const String caseTitle = "PC Case";
  static const String gpuTitle = "Graphics Card";
  static const String storageTitle = "Storage";
  static const String mbTitle = "Motherboard";
  static const String psuTitle = "Power Supply";
  static const String cpuTitle = "Processor";
  static const String ramTitle = "RAM";
}

class CategoryMap {
  static const categoryMap = <String, String>{
    CategorySlugs.caseSlug: CategoryTitles.caseTitle,
    CategorySlugs.gpuSlug: CategoryTitles.gpuTitle,
    CategorySlugs.storageSlug: CategoryTitles.storageTitle,
    CategorySlugs.mbSlug: CategoryTitles.mbTitle,
    CategorySlugs.psuSlug: CategoryTitles.psuTitle,
    CategorySlugs.cpuSlug: CategoryTitles.cpuTitle,
    CategorySlugs.ramSlug: CategoryTitles.ramTitle,
  };
}

class ReverseCategoryMap {
  static const categoryMap = <String, String>{
  CategoryTitles.caseTitle: CategorySlugs.caseSlug,
    CategoryTitles.cpuTitle: CategorySlugs.cpuSlug,
    CategoryTitles.mbTitle: CategorySlugs.mbSlug,
    CategoryTitles.gpuTitle: CategorySlugs.gpuSlug,
    CategoryTitles.psuTitle: CategorySlugs.psuSlug,
    CategoryTitles.ramTitle: CategorySlugs.ramSlug,
    CategoryTitles.storageTitle: CategorySlugs.storageSlug,
  };
}
