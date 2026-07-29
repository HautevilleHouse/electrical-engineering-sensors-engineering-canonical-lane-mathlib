import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.ElectricalEngineeringSensorsEngineeringCanonicalLaneLean.SensorMeasurementPackage
import HautevilleHouse.ElectricalEngineeringSensorsEngineeringCanonicalLaneLean.SensorFusionPackage
import HautevilleHouse.ElectricalEngineeringSensorsEngineeringCanonicalLaneLean.SensorEntropyPackage

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

structure SensorProcessingRouteObligations where
  measurement : SensorMeasurementPackage
  fusion : SensorFusionPackage
  entropy : SensorEntropyPackage
  signalConditioning : Prop
  calibrationClosed : Prop

structure SensorProcessingRouteEvidence (R : SensorProcessingRouteObligations) where
  measurementClosed : SensorMeasurementClosed R.measurement
  fusionClosed : SensorFusionClosed R.fusion
  entropyClosed : SensorEntropyClosed R.entropy
  signalConditioningClosed : R.signalConditioning
  calibrationClosed : R.calibrationClosed

def SensorProcessingRouteClosed (R : SensorProcessingRouteObligations) : Prop :=
  SensorMeasurementClosed R.measurement ∧
  SensorFusionClosed R.fusion ∧
  SensorEntropyClosed R.entropy ∧
  R.signalConditioning ∧
  R.calibrationClosed

theorem sensor_processing_route_closed_from_evidence
    (R : SensorProcessingRouteObligations) (E : SensorProcessingRouteEvidence R) :
    SensorProcessingRouteClosed R := by
  exact And.intro E.measurementClosed
    (And.intro E.fusionClosed
      (And.intro E.entropyClosed
        (And.intro E.signalConditioningClosed E.calibrationClosed)))

structure SensorCanonicalLaneRoute (A : AdmissibleClass) where
  obligations : SensorProcessingRouteObligations
  evidence : SensorProcessingRouteEvidence obligations
  bridgeClosedFromRoute : bridgeClosed A
  gateClosedFromRoute : gateClosed A

theorem sensor_route_yields_constrained_closure
    (A : AdmissibleClass) (R : SensorCanonicalLaneRoute A) :
    ConstrainedTheoremClosure A := by
  exact And.intro R.bridgeClosedFromRoute R.gateClosedFromRoute

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse