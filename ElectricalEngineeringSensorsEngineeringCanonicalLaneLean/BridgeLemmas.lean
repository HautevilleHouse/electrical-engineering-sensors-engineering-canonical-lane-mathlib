import ElectricalEngineeringSensorsEngineeringCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.measurementRange ∧ A.object.noiseModel

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse