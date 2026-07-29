import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

structure SensorSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure SensorAdmittedObject where
  space : SensorSpace
  measurementCapability : Prop
  calibrationStatus : Prop
  fusionCompatibility : Prop
  conclusion : measurementCapability ∧ calibrationStatus ∧ fusionCompatibility

structure SensorEndgameState where
  object : SensorAdmittedObject

def SensorWitnessClosed (O : SensorAdmittedObject) : Prop :=
  O.conclusion

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse