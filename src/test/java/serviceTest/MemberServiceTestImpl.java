package serviceTest;


import domainTest.MemberVOTest;

public class MemberServiceTestImpl implements MemberServiceTest {


		@Override
		public int login(MemberVOTest member) throws Exception {
			if(member.getId().equals("admin")) {
				return 1;
			}else {
				return 0;
			}
		}
		
}
