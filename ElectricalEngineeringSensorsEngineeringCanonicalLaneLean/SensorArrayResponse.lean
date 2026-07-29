import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalEngineeringSensorsEngineeringCanonicalLaneLean

structure SensorArrayResponsePackage {A : AdmissibleClass} {C : SensorCalibrationPackage A}
    {F : SensorFusionPackage C} {N : SensorNoiseModelPackage F}
    (T : SensorTransferFunctionPackage N) where
  spatialPattern : Prop
  beamformingCapability : Prop
  mutualCoupling : Prop
  elementDirectivity : Prop

structure SensorArrayResponseEvidence {A : AdmissibleClass} {C : SensorCalibrationPackage A}
    {F : SensorFusionPackage C} {N : SensorNoiseModelPackage F}
    {T : SensorTransferFunctionPackage N} (R : SensorArrayResponsePackage T) where
  spatialPatternClosed : R.spatialPattern
  beamformingCapabilityClosed : R.beamformingCapability
  mutualCouplingClosed : R.mutualCoupling
  elementDirectivityClosed : R.elementDirectivity

def SensorArrayResponseClosed {A : AdmissibleClass} {C : SensorCalibrationPackage A}
    {F : SensorFusionPackage C} {N : SensorNoiseModelPackage F}
    {T : SensorTransferFunctionPackage N} (R : SensorArrayResponsePackage T) : Prop :=
  R.spatialPattern ∧ R.beamformingCapability ∧ R.mutualCoupling ∧ R.elementDirectivity

theorem sensor_array_response_closed_from_evidence {A : AdmissibleClass} {C : SensorCalibrationPackage A}
    {F : SensorFusionPackage C} {N : SensorNoiseModelPackage F}
    {T : SensorTransferFunctionPackage N} (R : SensorArrayResponsePackage T)
    (E : SensorArrayResponseEvidence R) : SensorArrayResponseClosed R := by
  exact And.intro E.spatialPatternClosed
    (And.intro E.beamformingCapabilityClosed
      (And.intro E.mutualCouplingClosed E.elementDirectivityClosed))

end ElectricalEngineeringSensorsEngineeringCanonicalLaneLean
end HautevilleHouse
