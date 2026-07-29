import HautevilleHouse.ElectricalEngineeringSensorsEngineeringCanonicalLaneLean.SensorObjects

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass SensorAdmittedObject) : Prop :=
  SensorWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass SensorAdmittedObject) : bridgeClosed A := by
  exact A.object.conclusion

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse