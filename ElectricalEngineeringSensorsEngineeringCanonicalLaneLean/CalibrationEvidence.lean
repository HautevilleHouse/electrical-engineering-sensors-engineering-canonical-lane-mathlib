import HautevilleHouse.ElectricalEngineeringSensorsEngineeringCanonicalLaneLean.MeasurementModel

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

structure CalibrationPackage {M : MeasurementModelPackage} where
  referenceStandard : Type
  calibrationCurve : Type
  uncertaintyBudget : Prop
  traceability : Prop
  calibrationInterval : Prop

structure CalibrationEvidence {M : MeasurementModelPackage} (C : CalibrationPackage M) where
  uncertaintyBudgetClosed : C.uncertaintyBudget
  traceabilityClosed : C.traceability
  calibrationIntervalClosed : C.calibrationInterval

def CalibrationClosed {M : MeasurementModelPackage} (C : CalibrationPackage M) : Prop :=
  C.uncertaintyBudget ∧ C.traceability ∧ C.calibrationInterval

theorem calibration_closed_from_evidence {M : MeasurementModelPackage} (C : CalibrationPackage M) (E : CalibrationEvidence C) : CalibrationClosed C := by
  exact And.intro E.uncertaintyBudgetClosed (And.intro E.traceabilityClosed E.calibrationIntervalClosed)

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse