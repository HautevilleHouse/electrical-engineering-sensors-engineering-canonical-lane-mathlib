import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

structure SensorSignalPackage where
  signalType : Type u
  sensitivity : Type v
  noiseFloor : Type w
  bandwidth : Prop
  linearity : Prop
  signalToNoiseRatio : Prop
  sensitivitySpecified : Prop

structure SensorSignalEvidence (S : SensorSignalPackage) where
  bandwidthClosed : S.bandwidth
  linearityClosed : S.linearity
  signalToNoiseRatioClosed : S.signalToNoiseRatio
  sensitivitySpecifiedClosed : S.sensitivitySpecified

def SensorSignalClosed (S : SensorSignalPackage) : Prop :=
  S.bandwidth ∧ S.linearity ∧ S.signalToNoiseRatio ∧ S.sensitivitySpecified

theorem sensor_signal_closed_from_evidence (S : SensorSignalPackage) (E : SensorSignalEvidence S) : SensorSignalClosed S := by
  exact And.intro E.bandwidthClosed (And.intro E.linearityClosed (And.intro E.signalToNoiseRatioClosed E.sensitivitySpecifiedClosed))

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse