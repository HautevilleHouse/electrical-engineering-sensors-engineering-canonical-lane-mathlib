import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

structure SensorNoiseModelPackage {A : AdmissibleClass} {C : SensorCalibrationPackage A}
    (F : SensorFusionPackage C) where
  noiseCharacterization : Prop
  spectralProperties : Prop
  correlationStructure : Prop
  noiseSuppression : Prop

structure SensorNoiseModelEvidence {A : AdmissibleClass} {C : SensorCalibrationPackage A}
    {F : SensorFusionPackage C} (N : SensorNoiseModelPackage F) where
  noiseCharacterizationClosed : N.noiseCharacterization
  spectralPropertiesClosed : N.spectralProperties
  correlationStructureClosed : N.correlationStructure
  noiseSuppressionClosed : N.noiseSuppression

def SensorNoiseModelClosed {A : AdmissibleClass} {C : SensorCalibrationPackage A}
    {F : SensorFusionPackage C} (N : SensorNoiseModelPackage F) : Prop :=
  N.noiseCharacterization ∧ N.spectralProperties ∧ N.correlationStructure ∧ N.noiseSuppression

theorem sensor_noise_model_closed_from_evidence {A : AdmissibleClass} {C : SensorCalibrationPackage A}
    {F : SensorFusionPackage C} (N : SensorNoiseModelPackage F)
    (E : SensorNoiseModelEvidence N) : SensorNoiseModelClosed N := by
  exact And.intro E.noiseCharacterizationClosed
    (And.intro E.spectralPropertiesClosed
      (And.intro E.correlationStructureClosed E.noiseSuppressionClosed))

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse
