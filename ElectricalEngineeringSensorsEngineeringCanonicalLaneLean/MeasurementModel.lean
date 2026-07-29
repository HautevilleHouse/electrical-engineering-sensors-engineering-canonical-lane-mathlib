import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

structure MeasurementModelPackage (S : AdmissibleClass) where
  sensorType : String
  transferFunction : String
  noiseModel : Prop
  linearityRange : Prop
  bandwidth : Prop

structure MeasurementModelEvidence {S : AdmissibleClass} (M : MeasurementModelPackage S) where
  noiseModelClosed : M.noiseModel
  linearityRangeClosed : M.linearityRange
  bandwidthClosed : M.bandwidth

def MeasurementModelClosed {S : AdmissibleClass} (M : MeasurementModelPackage S) : Prop :=
  M.noiseModel ∧ M.linearityRange ∧ M.bandwidth

theorem measurement_model_closed_from_evidence {S : AdmissibleClass} (M : MeasurementModelPackage S) (E : MeasurementModelEvidence M) : MeasurementModelClosed M := by
  exact And.intro E.noiseModelClosed (And.intro E.linearityRangeClosed E.bandwidthClosed)

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse