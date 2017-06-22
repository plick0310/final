<%@ page contentType="text/html; charset=UTF-8" %>


<!-- Modal -->
				<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">LOGIN</h4>
							</div>


							<div class="modal-body">

								<form name="loginForm" method="post" action="">
									<table
										style="margin: 15px auto; width: 360px; border-spacing: 0px;">
										<tr align="center" height="60">
											<td><label for="userId" id="lblUserId" class="lbl">아이디</label>
												<input type="text" name="userId" id="userId" class="loginTF" maxlength="15" tabindex="1"></td>
										</tr>
										<tr align="center" height="60">
											<td><label for="userPwd" id="lblUserPwd" class="lbl">패스워드</label>
												<input type="password" name="userPwd" id="userPwd" class="loginTF" maxlength="20" tabindex="2"></td>
										</tr>
										<tr align="center" height="65">
											<td>
												<button type="button" onclick="sendLogin();" class="btn btn-default">로그인</button>
											</td>
										</tr>

										<tr align="center" height="45">
											<td>
											<a href=>아이디찾기</a>&nbsp;&nbsp;&nbsp;
											<a href=>패스워드찾기</a>&nbsp;&nbsp;&nbsp;
											<a href=>회원가입</a>
											</td>
										</tr>

										<tr align="center" height="40">
											<td><span style="color: blue;">${message}</span></td>
										</tr>

									</table>
								</form>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							</div>
						</div>

					</div>
				</div>


