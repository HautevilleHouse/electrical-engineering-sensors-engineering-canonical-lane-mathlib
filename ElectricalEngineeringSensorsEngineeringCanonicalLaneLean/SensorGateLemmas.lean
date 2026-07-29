import HautevilleHouse.ElectricalEngineeringSensorsEngineeringCanonicalLaneLean.SensorBridgeLemmas

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

def gateClosed (A : AdmissibleClass SensorAdmittedObject) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass SensorAdmittedObject) : gateClosed A := by
  exact A.gateWitness

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse