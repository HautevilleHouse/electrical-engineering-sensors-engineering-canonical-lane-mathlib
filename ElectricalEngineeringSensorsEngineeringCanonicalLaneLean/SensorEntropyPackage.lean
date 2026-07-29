import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

structure SensorEntropyPackage where
  entropyFunctional : Type u
  mutualInformation : Type v
  entropyRate : Prop
  dataProcessingInequality : Prop
  entropyRateClosed : entropyRate
  dataProcessingInequalityClosed : dataProcessingInequality

structure SensorEntropyEvidence (E : SensorEntropyPackage) where
  entropyRateClosed : E.entropyRate
  dataProcessingInequalityClosed : E.dataProcessingInequality

def SensorEntropyClosed (E : SensorEntropyPackage) : Prop :=
  E.entropyRate ∧ E.dataProcessingInequality

theorem sensor_entropy_closed_from_evidence (E : SensorEntropyPackage)
    (Ev : SensorEntropyEvidence E) : SensorEntropyClosed E := by
  exact And.intro Ev.entropyRateClosed Ev.dataProcessingInequalityClosed

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse