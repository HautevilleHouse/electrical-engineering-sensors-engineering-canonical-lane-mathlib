import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

structure SensorCalibrationPackage (S : AdmissibleClass) where
  sensorType : String
  calibrationParams : String
  referenceStandard : Prop
  driftCompensation : Prop
  temperatureCompensation : Prop

structure SensorCalibrationEvidence {S : AdmissibleClass} (C : SensorCalibrationPackage S) where
  referenceStandardClosed : C.referenceStandard
  driftCompensationClosed : C.driftCompensation
  temperatureCompensationClosed : C.temperatureCompensation

def SensorCalibrationClosed {S : AdmissibleClass} (C : SensorCalibrationPackage S) : Prop :=
  C.referenceStandard ∧ C.driftCompensation ∧ C.temperatureCompensation

theorem sensor_calibration_closed_from_evidence {S : AdmissibleClass} (C : SensorCalibrationPackage S) (E : SensorCalibrationEvidence C) : SensorCalibrationClosed C := by
  exact And.intro E.referenceStandardClosed (And.intro E.driftCompensationClosed E.temperatureCompensationClosed)

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse