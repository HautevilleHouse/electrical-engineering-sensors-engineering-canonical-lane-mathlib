import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

structure SensorAdmittedObject where
  sensorType : Type u
  measurand : Type v
  calibrationAvailable : Prop
  noiseModelAvailable : Prop
  conclusion : calibrationAvailable ∧ noiseModelAvailable

def SensorWitnessClosed (O : SensorAdmittedObject) : Prop :=
  O.calibrationAvailable ∧ O.noiseModelAvailable

structure SensorAdmissibleClass where
  object : SensorAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def sensorAdmittedClosure (A : SensorAdmissibleClass) : Prop :=
  SensorWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse
