import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EcologyNutrientCyclingCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  NutrientCyclingWitnessClosed A.ecosystem

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.ecosystem.conclusion

end EcologyNutrientCyclingCanonicalLaneLean
end HautevilleHouse