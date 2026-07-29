import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

structure SensorFusionPackage where
  fusionAlgorithm : Type u
  stateEstimate : Type v
  uncertaintyBounds : Prop
  convergenceRate : Prop
  uncertaintyBoundsClosed : uncertaintyBounds
  convergenceRateClosed : convergenceRate

structure SensorFusionEvidence (F : SensorFusionPackage) where
  uncertaintyBoundsClosed : F.uncertaintyBounds
  convergenceRateClosed : F.convergenceRate

def SensorFusionClosed (F : SensorFusionPackage) : Prop :=
  F.uncertaintyBounds ∧ F.convergenceRate

theorem sensor_fusion_closed_from_evidence (F : SensorFusionPackage)
    (E : SensorFusionEvidence F) : SensorFusionClosed F := by
  exact And.intro E.uncertaintyBoundsClosed E.convergenceRateClosed

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse