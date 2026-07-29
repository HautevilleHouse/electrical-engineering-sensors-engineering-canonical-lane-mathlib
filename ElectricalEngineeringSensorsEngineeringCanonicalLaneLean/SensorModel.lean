import ElectricalEngineeringSensorsEngineeringCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

structure SensorModelPackage where
  sensorType : String
  measurementFunction : Type u
  noiseDistribution : Type v
  calibrationData : Type w
  measurementRange : Prop
  noiseModelValid : Prop
  calibrationApplied : Prop

structure SensorModelEvidence (S : SensorModelPackage) where
  measurementRangeClosed : S.measurementRange
  noiseModelValidClosed : S.noiseModelValid
  calibrationAppliedClosed : S.calibrationApplied

def SensorModelClosed (S : SensorModelPackage) : Prop :=
  S.measurementRange ∧ S.noiseModelValid ∧ S.calibrationApplied

theorem sensor_model_closed_from_evidence (S : SensorModelPackage) (E : SensorModelEvidence S) :
    SensorModelClosed S := by
  exact And.intro E.measurementRangeClosed (And.intro E.noiseModelValidClosed E.calibrationAppliedClosed)

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse