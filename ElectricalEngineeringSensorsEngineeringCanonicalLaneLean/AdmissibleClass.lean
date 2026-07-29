import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

structure AdmissibleClass where
  object : SensorSignalPackage
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  SensorSignalClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse