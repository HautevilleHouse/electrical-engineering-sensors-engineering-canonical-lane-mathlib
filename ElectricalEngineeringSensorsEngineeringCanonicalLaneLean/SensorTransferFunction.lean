import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

structure SensorTransferFunctionPackage {A : AdmissibleClass} {C : SensorCalibrationPackage A}
    {F : SensorFusionPackage C} (N : SensorNoiseModelPackage F) where
  frequencyResponse : Prop
  phaseResponse : Prop
  bandwidth : Prop
  linearity : Prop
  timeDelay : Prop

structure SensorTransferFunctionEvidence {A : AdmissibleClass} {C : SensorCalibrationPackage A}
    {F : SensorFusionPackage C} {N : SensorNoiseModelPackage F}
    (T : SensorTransferFunctionPackage N) where
  frequencyResponseClosed : T.frequencyResponse
  phaseResponseClosed : T.phaseResponse
  bandwidthClosed : T.bandwidth
  linearityClosed : T.linearity
  timeDelayClosed : T.timeDelay

def SensorTransferFunctionClosed {A : AdmissibleClass} {C : SensorCalibrationPackage A}
    {F : SensorFusionPackage C} {N : SensorNoiseModelPackage F}
    (T : SensorTransferFunctionPackage N) : Prop :=
  T.frequencyResponse ∧ T.phaseResponse ∧ T.bandwidth ∧ T.linearity ∧ T.timeDelay

theorem sensor_transfer_function_closed_from_evidence {A : AdmissibleClass} {C : SensorCalibrationPackage A}
    {F : SensorFusionPackage C} {N : SensorNoiseModelPackage F}
    (T : SensorTransferFunctionPackage N) (E : SensorTransferFunctionEvidence T) :
    SensorTransferFunctionClosed T := by
  exact And.intro E.frequencyResponseClosed
    (And.intro E.phaseResponseClosed
      (And.intro E.bandwidthClosed
        (And.intro E.linearityClosed E.timeDelayClosed)))

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse
