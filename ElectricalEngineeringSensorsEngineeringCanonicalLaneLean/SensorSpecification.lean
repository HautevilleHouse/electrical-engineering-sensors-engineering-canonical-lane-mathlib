import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

structure SourceFile where
  path : String
  sha256 : String
  functionCount : Nat
  classCount : Nat
  assignmentCount : Nat
  parseOk : Bool
deriving Repr, DecidableEq

structure SourceFunctionDecl where
  file : String
  name : String
  args : List String
  returns : String
  doc : String
  line : Nat
  isAsync : Bool
deriving Repr, DecidableEq

structure SourceClassDecl where
  file : String
  name : String
  bases : List String
  doc : String
  line : Nat
deriving Repr, DecidableEq

structure SourceAssignmentDecl where
  file : String
  name : String
  value : String
  line : Nat
deriving Repr, DecidableEq

def sourceCheckoutHead : String := "abc123"
def sourceCheckoutClean : Bool := true

def sourceFiles : List SourceFile :=
  [{ path := "scripts/data_acquisition.py", sha256 := "sha256hash", functionCount := 3, classCount := 0, assignmentCount := 2, parseOk := true }]

def sourceFunctions : List SourceFunctionDecl :=
  [{ file := "scripts/data_acquisition.py", name := "acquire", args := ["config"], returns := "DataFrame", doc := "", line := 20, isAsync := false }]

def sourceClasses : List SourceClassDecl := []

def sourceAssignments : List SourceAssignmentDecl :=
  [{ file := "scripts/data_acquisition.py", name := "DEFAULT_CONFIG", value := "\"config/acquisition_config.json\"", line := 10 }]

def sourceFunctionCount : Nat := 1
def sourceClassCount : Nat := 0
def sourceAssignmentCount : Nat := 1

theorem source_file_count_checked : sourceFiles.length = 1 := by
  native_dec_trivial

theorem source_function_count_checked : sourceFunctions.length = 1 := by
  native_dec_trivial

theorem source_class_count_checked : sourceClasses.length = 0 := by
  native_dec_trivial

theorem source_assignment_count_checked : sourceAssignments.length = 1 := by
  native_dec_trivial

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse