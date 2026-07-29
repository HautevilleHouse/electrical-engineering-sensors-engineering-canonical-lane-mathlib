import ElectricalEngineeringSensorsEngineeringCanonicalLaneLean.SensorModel

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

structure CalibrationPackage {S : SensorModelPackage} where
  referenceStandard : Type u
  calibrationCurve : Type v
  uncertaintyBudget : Type w
  traceabilityEstablished : Prop
  correctionApplied : Prop
  residualErrorBounded : Prop

structure CalibrationEvidence {S : SensorModelPackage} (C : CalibrationPackage S) where
  traceabilityEstablishedClosed : C.traceabilityEstablished
  correctionAppliedClosed : C.correctionApplied
  residualErrorBoundedClosed : C.residualErrorBounded

def CalibrationClosed {S : SensorModelPackage} (C : CalibrationPackage S) : Prop :=
  C.traceabilityEstablished ∧ C.correctionApplied ∧ C.residualErrorBounded

theorem calibration_closed_from_evidence {S : SensorModelPackage}
    (C : CalibrationPackage S) (E : CalibrationEvidence C) :
    CalibrationClosed C := by
  exact And.intro E.traceabilityEstablishedClosed (And.intro E.correctionAppliedClosed E.residualErrorBoundedClosed)

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse