import ElectricalEngineeringSensorsEngineeringCanonicalLaneLean.Calibration

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

structure UncertaintyPackage {S : SensorModelPackage} {C : CalibrationPackage S} where
  typeAEvaluation : Prop
  typeBEvaluation : Prop
  combinedUncertainty : Prop
  expandedUncertainty : Prop
  coverageProbability : Prop

structure UncertaintyEvidence {S : SensorModelPackage} {C : CalibrationPackage S}
    (U : UncertaintyPackage S C) where
  typeAEvaluationClosed : U.typeAEvaluation
  typeBEvaluationClosed : U.typeBEvaluation
  combinedUncertaintyClosed : U.combinedUncertainty
  expandedUncertaintyClosed : U.expandedUncertainty
  coverageProbabilityClosed : U.coverageProbability

def UncertaintyClosed {S : SensorModelPackage} {C : CalibrationPackage S}
    (U : UncertaintyPackage S C) : Prop :=
  U.typeAEvaluation ∧ U.typeBEvaluation ∧ U.combinedUncertainty ∧
  U.expandedUncertainty ∧ U.coverageProbability

theorem uncertainty_closed_from_evidence {S : SensorModelPackage} {C : CalibrationPackage S}
    (U : UncertaintyPackage S C) (E : UncertaintyEvidence U) :
    UncertaintyClosed U := by
  exact And.intro E.typeAEvaluationClosed
    (And.intro E.typeBEvaluationClosed
      (And.intro E.combinedUncertaintyClosed
        (And.intro E.expandedUncertaintyClosed E.coverageProbabilityClosed)))

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse