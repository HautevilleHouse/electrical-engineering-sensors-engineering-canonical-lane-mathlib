import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

structure SensorMeasurementPackage where
  sensorType : Type u
  measurand : Type v
  measurementFunction : Measurand -> SensorType
  noiseModel : Prop
  calibrationParameters : Prop
  noiseModelClosed : noiseModel
  calibrationParametersClosed : calibrationParameters

structure SensorMeasurementEvidence (S : SensorMeasurementPackage) where
  noiseModelClosed : S.noiseModel
  calibrationParametersClosed : S.calibrationParameters

def SensorMeasurementClosed (S : SensorMeasurementPackage) : Prop :=
  S.noiseModel ∧ S.calibrationParameters

theorem sensor_measurement_closed_from_evidence (S : SensorMeasurementPackage)
    (E : SensorMeasurementEvidence S) : SensorMeasurementClosed S := by
  exact And.intro E.noiseModelClosed E.calibrationParametersClosed

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse