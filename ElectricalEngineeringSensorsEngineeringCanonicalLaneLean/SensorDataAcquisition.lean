import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

structure SourceImportDependency where
  file : String
  kind : String
  module : String
  name : String
  alias : String
  level : Nat
deriving Repr, DecidableEq

structure SourcePathDependency where
  file : String
  name : String
  path : String
  role : String
  line : Nat
deriving Repr, DecidableEq

def sourceImportDependencies : List SourceImportDependency :=
  [{ file := "scripts/data_acquisition.py", kind := "from_import", module := "__future__", name := "annotations", alias := "", level := 0 }]

def sourcePathDependencies : List SourcePathDependency :=
  [{ file := "scripts/data_acquisition.py", name := "DEFAULT_CONFIG", path := "config/acquisition_config.json", role := "artifact", line := 15 }]

def sourceImportDependencyCount : Nat := 1
def sourcePathDependencyCount : Nat := 1

theorem source_import_dependency_count_checked : sourceImportDependencies.length = 1 := by
  native_dec_trivial

theorem source_path_dependency_count_checked : sourcePathDependencies.length = 1 := by
  native_dec_trivial

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse