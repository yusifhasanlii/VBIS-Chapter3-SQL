1.Ən çətin hesab etdiyiniz SQL sorğusu hansı oldu?

Ən çətin sorğu 3.15(a) tapşırığı oldu. Çünki orada Brooklyn şəhərindəki hər bir filialda hesabı olan müştəriləri tapmaq tələb olunurdu. SQL-də bunu birbaşa tapan hazır funksiya yoxdu. Ona görə məcbur qalıb NOT EXISTS və EXCEPT istifadə etdim. Birinci bütün Brooklyn filiallarını tapdım, sonra müştərinin hesabı olan filialları oradan çıxdım. Əgər yerdə heç nə qalmırsa deməli müştərinin bütün filiallarda hesabı var. Bunun məntiqini tam tutana qədər bir az vaxt getdi.



2.Hansı sorğu üçün alt sorğu (subquery) istifadə etdiniz?

3.11(b) sualında 2017-ci ildən əvvəl dərs götürən tələbələri tapıb NOT IN ilə ümumi siyahıdan çıxardım. Sonra 3.11(d) tapşırığında FROM hissəsində alt sorğu yazdım ki, əvvəlcə departamentlərin maksimum maaşlarını tapım, çöldəki əsas sorğuda isə MIN funksiyası ilə onların içindən ən kiçiyini götürüm. Bir də 3.25 tapşırığında Philosophy departamentinin büdcəsini tapmaq üçün WHERE şərtinin içində sadə alt sorğu yazdım və digər departamentləri onunla müqayisə elədim.



3.JOIN istifadə etdiyiniz bir nümunəni izah edin.

3.24 tapşırığında. Orada bizə həm tələbənin oxuduğu departament, həm də ona məsləhətçi olan müəllimin departamenti lazım idi. Bu məlumatlar üç ayrı cədvəldə olduğu üçün əvvəlcə student cədvəlini advisor cədvəlinə tələbə ID-si ilə birləşdirdim. Sonra isə həmin nəticəni müəllim ID-si ilə instructor cədvəlinə JOIN etdim. Axırda da WHERE şərti ilə tələbə üçün Accounting, müəllim üçün Physics seçdim.



4.SQL sorğularını yazarkən qarşılaşdığınız bir problemi və onun həllini izah edin.

Əsas problem 3.11(a) və 3.11(d) tapşırıqlarını yazanda çıxdı. 3.11(a) sorğusunda Comp. Sci. departamentindən dərs götürən tələbələri tapanda gördüm ki, eyni tələbənin adı siyahıda bir neçə dəfə təkrar çıxır. Sonra baxdım ki, bir tələbə həmin departamentdən iki və ya üç fərqli dərs götürəndə JOIN onu hər dərs üçün ayrı sətirdə göstərir. Bunu düzəltmək üçün SELECT sözündən dərhal sonra DISTINCT əlavə elədim və təkrarlanan adlar silindi. Digər problemim isə 3.11(d) sualında MIN və MAX funksiyalarını birbaşa iç-içə yazmaq istəyəndə oldu, SQL buna icazə vermədi və xəta çıxdı. Onu da FROM hissəsində alt sorğu açıb cədvələ müvəqqəti ad verməklə həll elədim.

