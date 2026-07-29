import HautevilleHouse.ElectricalEngineeringSensorsEngineeringCanonicalLaneLean.SensorGateLemmas

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

def ConstrainedSensorClosure (A : AdmissibleClass SensorAdmittedObject) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_sensor_endgame (A : AdmissibleClass SensorAdmittedObject) : ConstrainedSensorClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse